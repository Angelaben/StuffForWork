# Useful links

# Useful commands

## To expose some directory in localhost

source : https://www.ostechnix.com/how-to-quickly-serve-files-and-folders-over-http-in-linux/

- ruby -run -ehttpd DIRECTORY -p PORT
- python -m http.server 8000

## Cheat Sheat tmux

http://www.rushiagr.com/blog/2016/06/16/everything-you-need-to-know-about-tmux-copy-pasting-ubuntu/

- ctrl + maj and mouse over will copy

## Git stuff

- https://coderwall.com/p/euwpig/a-better-git-log

- "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit

- https://www.ekino.com/articles/comment-squasher-efficacement-ses-commits-avec-gitn>%Creset' --abbrev-commit

* https://delicious-insights.com/fr/articles/bien-utiliser-git-merge-et-rebase/
* https://www.ekino.com/articles/comment-squasher-efficacement-ses-commits-avec-git

## Easy ssh

- https://linuxize.com/post/using-the-ssh-config-file/

## Vim (Someday you have to master it)

- https://artisan.karma-lab.net/vim-plugins-indispensables
- https://www.barbarianmeetscoding.com/blog/2019/02/08/boost-your-coding-fu-with-vscode-and-vim

## Docker

- https://docs.docker.com/engine/docker-overview/
- Throwable docker run `echo -e 'FROM busybox\nRUN echo "hello world"' | docker build -`
- The hyphen (-) takes the position of the PATH, and instructs Docker to read the build context (which only contains a Dockerfile) from stdin instead of a directory (is it the same with `cat` ?)

## Other

- Droppy for easy link in git
- Edit pdf https://dochub.com/
- Writing in terminal until a stopword `cat - <<EOF`
- Cool theme for ohmyzsh: refined
- Test GPU : GPUburn https://github.com/wilicc/gpu-burn to test gpu and stuff.

### Docker GPU burn

```docker
FROM nvidia/cudagl:10.0-devel-ubuntu16.04 as dev

WORKDIR /workspace
RUN apt update && apt install wget
RUN \
    wget http://wili.cc/blog/entries/gpu-burn/gpu_burn-1.0.tar.gz  && tar -xvzf gpu_burn-1.0.tar.gz \
    && make \
    ./gpu_burn 3
```

docker build --rm . -f test.dockerfile

### Script

```docker
docker build --no-cache  -<<EOF
FROM nvidia/cudagl:10.0-devel-ubuntu16.04 as dev
WORKDIR /workspace
RUN apt update && apt install wget
RUN     wget http://wili.cc/blog/entries/gpu-burn/gpu_burn-1.0.tar.gz  && tar -xvzf u_burn-1.0.tar.gz     && make
RUN ./gpu_burn 3
EOF
```
