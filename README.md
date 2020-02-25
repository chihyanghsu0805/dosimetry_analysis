# dosimetry_analysis
This repository contains codes that analyzes radiation dosimetry.

## Scale Dose
Dose by default is in Gy. However, in DICOM it is usually stored with DoseGridScaling factor ~0.001.
This causes DICOM to NIFTI converters to misinterpret dose values and might be out of ranre.
This code applies the DoseGridSclaing factor but stores the values in cGy so that the NIFTI converter can work correctly.

## Dose Variations
This code computes different variations of relative biological effectiveness.

McNamara, A.L., Schuemann, J. and Paganetti, H., 2015. A phenomenological relative biological effectiveness (RBE) model for proton therapy based on all published in vitro cell survival data. Physics in Medicine & Biology, 60(21), p.8399.

Paganetti, H., 2014. Relative biological effectiveness (RBE) values for proton beam therapy. Variations as a function of biological endpoint, dose, and linear energy transfer. Physics in Medicine & Biology, 59(22), p.R419.
