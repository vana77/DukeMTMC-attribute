clear;
pp = '/home/yutian/re-id/dataset/DukeMTMC/bounding_box_test/*.jpg';
load('duke_attribute.mat');
file = dir(pp);
counter_data=1;
counter_last = 1;
class = 0;
c_last = '';
cc = [];
m = zeros(1,1,3);
%% change ID-level attribute to instance-level
for i=1:length(file)
    c = strsplit(file(i).name,'_');
    if(~isequal(c{1},c_last))
        class = class + 1;
        fprintf('%d::%d\n',class,counter_data-counter_last);
        cc=[cc;counter_data-counter_last];
        c_last = c{1};
        counter_last = counter_data;
    end
    dtupblack(counter_data) = duke_attribute.test.upblack(class);
    dtupwhite(counter_data) = duke_attribute.test.upwhite(class);
    dtupred(counter_data) = duke_attribute.test.upred(class);
    dtuppurple(counter_data) = duke_attribute.test.uppurple(class);
    dtupblue(counter_data) = duke_attribute.test.upblue(class);
    dtupgreen(counter_data) = duke_attribute.test.upgreen(class);
    dtupgray(counter_data) = duke_attribute.test.upgray(class);
    dtupbrown(counter_data) = duke_attribute.test.upbrown(class);
    
    dtdownblack(counter_data) = duke_attribute.test.downblack(class);
    dtdownwhite(counter_data) = duke_attribute.test.downwhite(class);
    dtdownred(counter_data) = duke_attribute.test.downred(class);
    dtdownblue(counter_data) = duke_attribute.test.downblue(class);
    dtdowngreen(counter_data) = duke_attribute.test.downgreen(class);
    dtdowngray(counter_data) = duke_attribute.test.downgray(class);
    dtdownbrown(counter_data) = duke_attribute.test.downbrown(class);
    
    dtboots(counter_data) = duke_attribute.test.boots(class);
    dtgender(counter_data) = duke_attribute.test.gender(class);
    dtshoes(counter_data) = duke_attribute.test.shoes(class);
    dttop(counter_data) = duke_attribute.test.top(class);
    dthat(counter_data) = duke_attribute.test.hat(class);
    dtbackpack(counter_data) = duke_attribute.test.backpack(class);
    dthandbag(counter_data) = duke_attribute.test.handbag(class);
    dtbag(counter_data) = duke_attribute.test.bag(class);
    counter_data = counter_data + 1;
end

%% evaluate each attribute
load('gallery_duke.mat')
temp1 = 0;temp2 = 0;temp3 = 0;temp4 = 0;temp5 = 0;temp6 = 0;temp7 = 0;temp8 = 0;
temp9 = 0; temp10 = 0;
for i = 1:length(file)
    if (gallery(i,1)==dtgender(i))
        temp1 = temp1+1;
    end
    if (gallery(i,2)==dttop(i))
        temp2 = temp2+1;
    end
    if (gallery(i,3)==dtboots(i))
        temp3 = temp3+1;
    end
    if (gallery(i,4)==dtshoes(i))
        temp4 = temp4+1;
    end
    if (gallery(i,5)==dthat(i))
        temp5 = temp5+1;
    end
    if (gallery(i,6)==dtbackpack(i))
        temp6 = temp6+1;
    end
    if (gallery(i,7)==dtbag(i))
        temp7 = temp7+1;
    end
    if (gallery(i,8)==dthandbag(i))
        temp8 = temp8+1;
    end
    if(gallery(i,9)==1 && dtupblack(i)==1)
        temp9 = temp9+1;
    end
    if(gallery(i,9)==2 && dtupwhite(i)==1)
        temp9 = temp9+1;
    end
    if(gallery(i,9)==3 && dtupred(i)==1)
        temp9 = temp9+1;
    end
    if(gallery(i,9)==4 && dtuppurple(i)==1)
        temp9 = temp9+1;
    end
    if(gallery(i,9)==5 && dtupgray(i)==1)
        temp9 = temp9+1;
    end
    if(gallery(i,9)==6 && dtupblue(i)==1)
        temp9 = temp9+1;
    end
    if(gallery(i,9)==7 && dtupgreen(i)==1)
        temp9 = temp9+1;
    end
    if(gallery(i,9)==8 && dtupbrown(i)==1)
        temp9 = temp9+1;
    end
     if(gallery(i,10)==1 && dtdownblack(i)==1)
        temp10 = temp10+1;
    end
    if(gallery(i,10)==2 && dtdownwhite(i)==1)
        temp10 = temp10+1;
    end
    if(gallery(i,10)==3 && dtdownred(i)==1)
        temp10 = temp10+1;
    end
    if(gallery(i,10)==5 && dtdowngray(i)==1)
        temp10 = temp10+1;
    end
    if(gallery(i,10)==6 && dtdownblue(i)==1)
        temp10 = temp10+1;
    end
    if(gallery(i,10)==7 && dtdowngreen(i)==1)
        temp10 = temp10+1;
    end
    if(gallery(i,10)==8 && dtdownbrown(i)==1)
        temp10 = temp10+1;
    end
end

precision1 = temp1 /i
precision2 = temp2 /i
precision3 = temp3 /i
precision4 = temp4 /i
precision5 = temp5 /i
precision6 = temp6 /i
precision7 = temp7 /i
precision8 = temp8 /i
precision9 = temp9 /i
precision10 = temp10 /i