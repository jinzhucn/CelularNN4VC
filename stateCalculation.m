function outputState = stateCalculation(bias, input, inputSynapticMatrix, output, feedbackMatrix )
    % Input u_kl is usually the pixel intensity of image, normalized with
    % -1 to 1 according to Chua's ; for a still iamge, u_kl is constant all
    % the time, for video u_kl will be a function of time.
    % normally, the inputSynaptic, feedback and bias could vary as position
    % changes, here we assum they are time invariant.
    % 
    %
    % A feedback synaptic weight in feedbackMatrix (A) is said to be
    % excitatory if and only if it is positive,  (inhibitory if and only if it is negative)
    %
    % Zero-feedback (feedforward) class CNN: feedbackMatrix (A) = 0;
    %
    % Zero-input (Autonomous) class CNN, if and only if the inputSynapticMatrix
    % (B) =0;
    %
    % Uncoupled (scalar) class CNN, if and only if the feedbackMatrix A =
    % 0 except the center weights, each cell of an uncoupled CNN is described 
    % by a scalar nonlienar ODE which is not coupled with its neighbors.
    % 

    outputState = inputSynapticMatrix * input + feedbackMatrix * output + bias;

end