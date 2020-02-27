function visualize_rbe_variations(dose, let, mcnamara, beltran, paganetti, faught, slices, output)

LET_colormap = colormap(jet(16));
LET_colormap(1, :) = [0 0 0];

dose_colormap = colormap(jet(64));
dose_colormap(1, :) = [0 0 0];

n_slices = size(slices, 2);
for i = 1:n_slices

    if i == 1
        cat_LET_image = squeeze(let(:, :, slices(i)));
        cat_dose_image = squeeze(dose(:, :, slices(i)));
        cat_mcnamara_image = squeeze(mcnamara(:, :, slices(i)));
        cat_beltran_image = squeeze(beltran(:, :, slices(i)));
        cat_paganetti_image = squeeze(paganetti(:, :, slices(i)));
        cat_faught_image = squeeze(faught(:, :, slices(i)));
    else
        cat_LET_image = [cat_LET_image squeeze(let(:, :, slices(i)))];
        cat_mcnamara_image = [cat_mcnamara_image squeeze(mcnamara(:, :, slices(i)))];
        cat_beltran_image = [cat_beltran_image squeeze(beltran(:, :, slices(i)))];
        cat_paganetti_image = [cat_paganetti_image squeeze(paganetti(:, :, slices(i)))];
        cat_faught_image = [cat_faught_image squeeze(faught(:, :, slices(i)))];
        cat_dose_image = [cat_dose_image squeeze(dose(:, :, slices(i)))];
    end
    
end
subplot(3,2,1)
imshow(cat_LET_image, LET_colormap)
title('LET')
subplot(3,2,2)
imshow(cat_mcnamara_image, dose_colormap)
title('McNamara')
subplot(3,2,3)
imshow(cat_beltran_image, dose_colormap)
title('Beltran')
subplot(3,2,4)
imshow(cat_paganetti_image, dose_colormap)
title('Paganetti')
subplot(3,2,5)
imshow(cat_faught_image, dose_colormap)
title('Faught')
subplot(3,2,6)
imshow(cat_dose_image, dose_colormap)
title('RTDose')
print(output, '-r600', '-dpng')

end