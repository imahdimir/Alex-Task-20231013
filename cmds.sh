# simulation
simulate.py 1000 0.5 ./ --nfam 30000 --impute --n_am 20 --r_par 0.5 --save_par_gts

# combining offspirng and parents genotypes
plink --bfile chr_1 --bmerge chr_1_par --out chr_1_combined

# % ture direct effect + noise based on observed genotypes
pgs.py direct_v1_obs --bed chr_@_combined --weights causal_effects.txt --beta_col direct_v1 --pedigree pedigree.txt
pgs.py direct_v1_obs --pgs direct_v1_obs.pgs.txt --phenofile phenotype.txt

# % ture direct effect 
pgs.py direct_obs --bed chr_@_combined --weights causal_effects.txt --beta_col direct --pedigree pedigree.txt
pgs.py direct_obs --pgs direct_obs.pgs.txt --phenofile phenotype.txt

