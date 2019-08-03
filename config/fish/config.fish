function ll
    ls --human-readable -l
end

function ssh_control_ody
    ssh -Y -C -o ServerAliveInterval=30 -fN ody
end

# make anaconda first python
set PATH /Users/acm/anaconda3/bin $PATH

set PATH /usr/local/bin $PATH

# latexmk
#set PATH /usr/local/texlive/2018/bin/x86_64-darwin $PATH
