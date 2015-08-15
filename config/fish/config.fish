function ll
    ls --human-readable -l
end

function ssh_control_ody
    ssh -Y -C -o ServerAliveInterval=30 -fN ody
end

# make anaconda first python
set PATH /Users/acm/anaconda/bin $PATH

