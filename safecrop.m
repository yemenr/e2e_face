function I = safecrop(I,b)
    b(3:4) = b(1:2) + b(3:4);
    b = round(b);
    padx0 = max(0, 1-b(1));
    padx1 = max(0, b(3)-size(I,2));
    pady0 = max(0, 1-b(2));
    pady1 = max(0, b(4)-size(I,1));
    padx0 = max(padx0,padx1);
    pady0 = max(pady0,pady1);
    b([1,3]) = b([1,3]) + padx0;
    b([2,4]) = b([2,4]) + pady0;
    I = padarray(I, double([pady0, padx0]), 'replicate');
    I = I(b(2):b(4),b(1):b(3),:);