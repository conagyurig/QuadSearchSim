function sample = gen_sample(sample_size)
    sample = zeros(2048,2048);
    size1 = size(sample);
    sizex = size1(1);
    sizey = size1(2);
    for i = 1:2048;
        for j = 1:2048;
            x = randi([0 1000000], 1, 1);
            if x > 999999;
                sample(i,j) = 1;
            end
        end
    end
    se = strel('disk',200,8);
    samplelarge = imdilate(sample, se);
    se = strel('disk',80,8);
    samplesmall = imdilate(sample, se);
    for i = 1:2048;
        for j = 1:2048;
            x = randi([0 10000], 1, 1);
            if samplesmall(i,j) == 1;
                sample(i,j) = 1;
            end
            if x>9999 && samplelarge(i,j) == 1
                sample(i,j) = 1;
                %can speed up if random number generated only if samplelarge = 1
            end
        end
    end
    se = strel('disk',60,8);
    sample = imdilate(sample, se);
    
end