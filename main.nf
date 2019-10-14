nextflow.preview.dsl=2

include './src/nf-module/main.nf' params(params)

process masterPrint {
    input:
        file params.master.input
    output:
        file "output.txt"
    script:
    """
    echo "nf-master"
    cp ${params.master.input} output.txt
    """
}

workflow {
    masterPrint( file(params.master.input) )
    modulePrint( masterPrint().out )
}

