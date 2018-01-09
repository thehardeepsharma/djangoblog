from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.shortcuts import render, get_object_or_404
from django.views.generic import ListView, DetailView, FormView
from django.views.generic.edit import FormMixin, CreateView
from .models import Post, Comment
from django.utils import timezone
from .forms import PostForm, CommentForm
from django.shortcuts import redirect

class PostListView(ListView):
	model = Post
	template_name = 'blog/post_list.html'
	paginate_by = 3	
	
	def get_context_data(self, **kwargs):
		context = super(PostListView, self).get_context_data(**kwargs)
		list_post = Post.objects.all()
		paginator = Paginator(list_post, self.paginate_by)
		page = self.request.GET.get('page')
		try:
			posts = paginator.page(page)
		except PageNotAnInteger:
			posts = paginator.page(1)
		except EmptyPage:
			posts = paginator.page(paginator.num_pages)
			
		context['posts'] = posts
		return context
		

class PostDetailView(FormView, DetailView):
	model = Post
	template_name = 'blog/post_detail.html'
	form_class = CommentForm
	
	def get_context_data(self, **kwargs):		
		context = super(PostDetailView, self).get_context_data(**kwargs)
		context['form'] = self.get_form()
		context['comments'] = Comment.objects.filter(post_id=self.get_object().pk).order_by('comment_date')
		return context
		
	def form_valid(self, form):		
		comment = CommentForm(form.data)
		if form.is_valid():
			cForm = form.save(commit=False)
			cForm.post = self.get_object()
			cForm.comment_date = timezone.now()
			cForm.save()
			return redirect('blog:post_list')
		

class PostView(CreateView):
	model = Post
	template_name = 'blog/post_edit.html'
	form_class = PostForm
	
	def form_valid(self, form):
		if form.is_valid():
			form.pub_date = timezone.now()	
			form.save()
			return redirect('blog:post_detail', pk=self.get_object().pk)
		
			

def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    comments = Comment.objects.filter(post_id=post.pk).order_by('comment_date')
    if request.method == "POST":
        form  = CommentForm(request.POST)
        if form.is_valid():
            cForm = form.save(commit=False)
            cForm.post = post    
            cForm.comment_date = timezone.now()
            cForm.save()
            return redirect('blog:post_detail', pk=post.pk)
    else:
        form = CommentForm()
            
    return render(request, 'blog/post_detail.html', {'post': post, 'comments':comments, 'form': form}) 
    
def post_new(request):
    if request.method == "POST":
        form = PostForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.pub_date = timezone.now()
            post.save()
            return redirect('blog:post_detail', pk=post.pk)
    else:
        form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
 
 
    
def post_edit(request, pk):
    post = get_object_or_404(Post, pk=pk)
    if request.method == "POST":
        form = PostForm(request.POST, instance=post)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('blog:post_detail', pk=post.pk)
    else:
        form = PostForm(instance=post)
    return render(request, 'blog/post_edit.html', {'form': form})
