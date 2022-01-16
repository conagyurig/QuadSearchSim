function [set,time] = recurs(sample, quada, set,time)
    %recursive algorithm to carry out zone exclusion algorithm
    if quada(1) == 4
        pos = [quada(3), quada(4)];
        set = [set, pos];
        time = time + 16;
    else
        time = time + (quada(1)*quada(2))/64;
        quad1a = [0,0,0,0];
        quad1b = [0,0,0,0];
        quad1c = [0,0,0,0];
        quad1d = [0,0,0,0];
        [quad1a,quad1b,quad1c,quad1d] = break_quad(quada);
        if scan(sample, quad1a) == false;
            z = false;
        else
            [set,time] = recurs(sample, quad1a, set,time);
        end
        if scan(sample, quad1b) == false;
            z = false;
        else
            [set,time] = recurs(sample, quad1b, set,time);
        end
        if scan(sample, quad1c) == false;
            z = false;
        else
            [set,time] = recurs(sample, quad1c, set,time);
        end
        if scan(sample, quad1d) == false;
            z = false;
        else
            [set,time] = recurs(sample, quad1d, set,time);
        end
    end
end