function marker_genes_loci = search_gene_loci(marker_genes,species)
Rscript = '"Rscript"';

filefolder = 'intermediateFiles';
if ~isfolder(filefolder)
    mkdir intermediateFiles
end

dlmwrite(fullfile(filefolder,'species.csv'),species,'delimiter', '')
dlmcell(fullfile(filefolder,'factor_genes.txt'),marker_genes)

% Calling R
RscriptFileName = ' ../scAI/search_for_regions.R ';
eval([' system([', '''', Rscript, RscriptFileName, '''', ' filefolder]);']);

Loci_genes = readtable(fullfile(filefolder,'factor_genes_loci.txt'),'ReadVariableNames',false);
Loci_genes.Properties.VariableNames = {'genes','chr','starts','ends'};
% note genes' order
[~,~,ord] = intersect(marker_genes,Loci_genes.genes,'stable');
marker_genes_loci = Loci_genes(ord,:);
