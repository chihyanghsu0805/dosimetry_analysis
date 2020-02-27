function scale_dose(dicom_list, output_list)

num_subjects = size(dicom_list, 1);
for i = 1:num_subjects
    
    dicom_path = dicom_list{i};
    dose = dicomread(dicom_path);
    info = dicominfo(dicom_path);
    dose = double(dose);
    dose = dose*info.DoseGridScaling;
    dose = dose*100;
    dose = uint16(dose);
    info.DoseGridScaling = 1;
    info.SeriesInstanceUID = dicomuid;
    
    output_path = output_list{i};
    if ~exist(output_path, 'dir')
        mkdir(output_path)
    end
    dicomwrite(dose, output_path, info, 'CreateMode', 'copy')
    
end
