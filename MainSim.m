
clear all;
close all;

sample = zeros(2048,2048);
%sets the number of pixels to be scanned in the sample



size1 = size(sample);
sizex = size1(1);
sizey = size1(2);
for i = 1:2048;
    for j = 1:2048;
    x = randi([0 10000000], 1, 1);
    if x > 9999986;
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
       if x>9998 && samplelarge(i,j) == 1
           sample(i,j) = 1;
           %can speed up if random number generated only if samplelarge = 1
       end
    end
end
se = strel('disk',60,8);
sample = imdilate(sample, se);
%section above generates the tumour like sample distribution



figure()
image(sample,'CDataMapping','scaled')
%view a distribution

%run zone exclusion algorithm
quada = [2048,2048,1,1];
%ans = scan(sample,quad);
time = 0
set = [0]
store_density = []
[set,time] = recurs(sample, quada, set,time);
density = (sum(sample,'All')/(2048*2048))*100;
scantime = 2048*2048;
efficiency = scantime/time
store = [efficiency]
store_density = [store_density density]
for i = 1:30
    time = 0;
    set = [0];
    sample = gen_sample(2048);
    [set,time] = recurs(sample, quada, set,time);
    efficiency = scantime/time
    density = (sum(sample,'All')/(2048*2048))*100
    store = [store efficiency]
    store_density = [store_density density]
end
output = zeros (2048,2048);
size2 = size(set);


%figure()
%image(output,'CDataMapping','scaled')
%colorbar
efficiency = scantime/time
   
scatter(store_density,store)







