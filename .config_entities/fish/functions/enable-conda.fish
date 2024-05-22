function enable-conda -d "Enable miniconda3/anaconda3"
   if set -q CONDA_ROOT; and [ -x "$CONDA_ROOT"/bin/conda ]
      eval "$("$CONDA_ROOT"/bin/conda shell.fish hook)"
   end
end
