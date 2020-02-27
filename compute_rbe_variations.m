function [mcnamara, beltran, paganetti, faught] = compute_rbe_variations(dose_path, let_path, constants, output_path)

a_b = constants.a_b;
dose_per_fraction = constants.dose_per_fraction;

dose_data = dicomread(dose_path);
dose_info = dicominfo(dose_path);
dose_data = double(dose_data)*dose_info.DoseGridScaling;
dose_data = dose_data/100;

let_data = dicomread(let_path);
let_info = dicominfo(let_path);
let_data = double(let_data)*let_info.DoseGridScaling;
let_data = let_data/100;

mcnamara = compute_mcnamara(dose_data, let_data, a_b, dose_per_fraction);
niftiwrite(mcnamara, [output_path '/scaled.mcnamara.nii'], dose_info, 'Compressed', 1)

beltran = compute_beltran(dose_data, let_data, a_b, dose_per_fraction);
niftiwrite(beltran, [output_path '/scaled.beltran.nii'], dose_info, 'Compressed', 1)

paganetti = compute_paganetti(dose_data, let_data, a_b, dose_per_fraction);
niftiwrite(paganetti, [output_path '/scaled.paganetti.nii'], dose_info, 'Compressed', 1)

faught = compute_faught(dose_data, let_data,  a_b, dose_per_fraction);
niftiwrite(faught, [output_path '/scaled.faught.nii'], dose_info, 'Compressed', 1)

function faught = compute_faught(dose_data, let_data, ~, ~)
faught = dose_data.*(0.9863+0.04545*let_data);
faught = faught*100;
faught = int16(faught);

function paganetti = compute_paganetti(dose_data, let_data, ~, ~)
paganetti = dose_data.*(1+0.04*let_data);
paganetti = paganetti*100;
paganetti = int16(paganetti);

function beltran = compute_beltran(dose_data, let_data, ~, ~)
beltran = 1.1*dose_data.*(0.8+0.08*let_data);
beltran = beltran*100;
beltran = int16(beltran);

function mcnamara = compute_mcnamara(dose_data, let_data, a_b, dose_per_fraction)
mcnamara = a_b^2;
mcnamara = mcnamara+4*dose_per_fraction*a_b*0.999064+dose_per_fraction*0.35605*let_data;
mcnamara = mcnamara+4*dose_per_fraction^2*(1.1012-0.0038703*sqrt(a_b)*let_data).^2;
mcnamara = sqrt(mcnamara)-a_b;
mcnamara = mcnamara/dose_per_fraction/2;
mcnamara = mcnamara.*dose_data;
mcnamara = mcnamara*100;
mcnamara = int16(mcnamara);