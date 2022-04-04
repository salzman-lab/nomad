
process COMPUTE_ANCHOR_SCORES {

    label 'process_low'
    conda (params.enable_conda ? "conda-forge::python=3.9.5 pandas=1.4.1" : null)


    input:
    path ch_targets_samplesheet
    val bound_distance
    val max_distance

    output:
    path outfile_counts_distances   , emit: anchor_target_counts
    path outfile_anchor_scores      , emit: anchor_scores

    script:
    outfile_counts_distances        = "anchor_targets_counts.tsv"
    outfile_anchor_scores           = "anchor_scores.tsv"
    """
    compute_anchor_scores.py \\
        --samplesheet ${ch_targets_samplesheet} \\
        --bound_distance ${bound_distance} \\
        --max_distance ${max_distance} \\
        --outfile_counts_distances ${outfile_counts_distances} \\
        --outfile_anchor_scores ${outfile_anchor_scores}
    """
}
