from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.shortcuts import render, get_object_or_404
from .models import Post, Comment
from django.utils import timezone
from .forms import PostForm, CommentForm
from django.shortcuts import redirect

def post_list(request):
    allposts = Post.objects.order_by('pub_date')
    paginator = Paginator(allposts, 2, 1) # Show 2 contacts per page 1 is the orphan number

    page = request.GET.get('page')
    try:
        posts = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        posts = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        posts = paginator.page(paginator.num_pages)

    return render(request, 'blog/post_list.html', {'posts': posts})
    
    #posts = Post.objects.filter(pub_date__lte=timezone.now()).order_by('pub_date')
    ##posts = Post.objects.order_by('pub_date')
    ##return render(request, 'blog/post_list.html', {'posts': posts})
 
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