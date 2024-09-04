%% This function creates a more colorblind friendly orange to white to blue
% colormap that I can just call in matlab scripts

function c = cbf_div()

rgbmax = 255;
colorblocks = [1/rgbmax, 119/rgbmax, 204/rgbmax;
               rgbmax/rgbmax rgbmax/rgbmax rgbmax/rgbmax;
               208/rgbmax, 52/rgbmax, 0/rgbmax];

num_colors = size(colorblocks,1);
left_col = colorblocks(:,1);
mid_col = colorblocks(:,2);
right_col = colorblocks(:,3);
new_cmap = [];

for i = 1:num_colors-1
    left_bit = rot90(linspace(left_col(i),left_col(i+1)),-1);
    mid_bit = rot90(linspace(mid_col(i),mid_col(i+1)),-1);
    right_bit = rot90(linspace(right_col(i),right_col(i+1)),-1);
    chunk = cat(2,left_bit,mid_bit,right_bit);
    new_cmap = cat(1,new_cmap,chunk);
end

c = new_cmap;

end


