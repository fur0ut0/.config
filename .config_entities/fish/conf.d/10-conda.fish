set -q CONDA_ROOT; or set -Ux CONDA_ROOT "$XDG_DATA_HOME"/miniconda3
if [ -x "$CONDA_ROOT"/bin/conda ]
    eval "$("$CONDA_ROOT"/bin/conda shell.fish hook)"
end
