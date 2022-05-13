#! /usr/bin/env Python

import pandas as pd

deseq = pd.read_csv('/home/innaf/Genome_analysis_project/results/Deseq/Deseq_analysis_table.csv')
annotation = pd.read_csv('/home/innaf/Genome_analysis_project/results/annotation/annotation.tsv', sep='\t')

down_regulated = deseq.nsmallest(n=10, columns=['log2FoldChange'], keep='all')
up_regulated = deseq.nlargest(n=10, columns=['log2FoldChange'], keep='all')

down_regulated_ID = down_regulated['Unnamed: 0']
up_regulated_ID = up_regulated['Unnamed: 0']

down_regulated_df = annotation[annotation['locus_tag'].isin(down_regulated_ID.values.tolist())][['locus_tag', 'gene', 'product']]
up_regulated_df = annotation[annotation['locus_tag'].isin(up_regulated_ID.values.tolist())][['locus_tag', 'gene', 'product']]

regulated = []
for i in range(10):
	regulated.append('Down regulated')
down_regulated_df.insert(0, 'Regulation', regulated)

regulated = []
for i in range(10):
	regulated.append('Up regulated')
up_regulated_df.insert(0, 'Regulation', regulated)

df_results = pd.concat([down_regulated_df, up_regulated_df], axis=0)
df_log = pd.concat([down_regulated, up_regulated], axis=0)[['Unnamed: 0', 'log2FoldChange']]
df_log.columns = ['locus_tag', 'log2FoldChange']

result = df_results.merge(df_log, on='locus_tag', how='outer')
result.to_csv('regulated.csv', index=False)
