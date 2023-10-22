# pip install --upgrade pip
# pyenv install 3.9.17
# pyenv virtualenv 3.9.17 sim
# pyenv activate sim
# pip install sniper==0.0.18

## cd to the directory where you want to save the simulated data
## I didn't make the sim directory, and have removed it from the commands below, I just save to CWD ($PWD)

# simulate 20 generation of AM with 30K families
simulate.py 1000 0.5 ./ --nfam 30000 --impute --n_am 20 --r_par 0.5 --save_par_gts

# imputing to generate imputed genotypes file to use it in pgs analysis
impute.py --ibd chr_@ --bed chr_@ --pedigree pedigree.txt --out chr_@ --threads 4

# compute the PGS using the true direct genetic effects as weights
pgs.py direct_v1 --bed chr_@ --imp chr_@ --weights causal_effects.txt --beta_col direct_v1

# estimate direct effect and average NTC of the PGS
pgs.py direct_v1 --pgs direct_v1.pgs.txt --phenofile phenotype.txt