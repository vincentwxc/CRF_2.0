function set_global_path

if (~isdeployed)
  addpath graphical_model/
  addpath inference/
  addpath learning
  addpath svm-struct-matlab-1.2/
  addpath tools/
  addpath evaluation/
  addpath BCFWstruct-master/
  addpath BCFWstruct-master/solvers/
  addpath BCFWstruct-master/solvers/helpers/
  addpath BCFWstruct-master/demo/
  addpath CAD120/
  
end

end
