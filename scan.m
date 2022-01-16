function ans = scan(sample, quad)
    %function scans a region and returns yes or no if the region has exotic
    %media
    ans = false;
    for i = quad(3):(quad(3)+quad(1))-1;
        for j = quad(4):(quad(4)+quad(2))-1;
            if sample(i,j) == 1;
                ans = true;
                break;
            end
        end
        if ans == true;
            break;
        end
    end
    
end