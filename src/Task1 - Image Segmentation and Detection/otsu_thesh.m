function output = otsu_thesh(img)
    output = imbinarize(img, 'adaptive', 'Sensitivity', 0.35);
end 