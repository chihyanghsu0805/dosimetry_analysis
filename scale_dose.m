function scale_dose(dicom_path, output_path)

dicom_path = dicom_path;
dose = dicomread(dicom_path);
info = dicominfo(dicom_path);
dose = double(dose);
dose = dose*info.DoseGridScaling;
dose = dose*100;
dose = uint16(dose);
info.DoseGridScaling = 1;
info.SeriesInstanceUID = dicomuid;

if ~isempty(output_path)
    if ~exist(output_path, 'dir')
        mkdir(output_path)
    end
    dicomwrite(dose, output_path, info, 'CreateMode', 'copy')
end


