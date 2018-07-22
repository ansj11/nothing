function y = conv_op(x, F, pad, stride)

%% padding
[h,w,c] = size(x);
k_sz  = size(F);
Size = floor( ([h,w]-k_sz+2*pad)/stride )+1;
padding = zeros(h+2*pad,w+2*pad,c);
padding(pad+1:end-pad,pad+1:end-pad,:) = double(x);
out = zeros([Size,c]);

s = floor(k_sz);
% deal with filter
for c=1:3
    for i = 0:Size(1)-1
        for j = 0:Size(2)-1
            out(i+1,j+1,c) = sum(sum(padding(stride*i+1:stride*i+3,stride*j+1:stride*j+3,c).*F));
        end
    end
end
y = out;
