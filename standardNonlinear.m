function outputY = standardNonlinear(inputX)
    % standard nonlinearity
    outputY = 0.5 * abs(inputX + 1) - 0.5 * abs(inputX - 1);
end