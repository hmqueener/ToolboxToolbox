function value = tbGetPref(persistentPrefs, preferenceName, defaultValue)
%% Get a preference if it exists, or use a default.
%
% value = tbGetPref(preferenceName, defaultValue) returns the
% value of the Matlab preference with the given preferenceName, in the
% 'ToolboxToolbox' group.  If there is no such value, returns the given
% default value.
%
% The idea here is to make it an easy one-liner to use a configured
% preference value, or default to a hard-coded convention.
%
% 2016 benjamin.heasly@gmail.com

parser = inputParser();
parser.KeepUnmatched = true;
parser.addRequired('preferenceName', @ischar);
parser.addRequired('defaultValue');
parser.parse(preferenceName, defaultValue);
preferenceName = parser.Results.preferenceName;
defaultValue = parser.Results.defaultValue;

if isfield(persistentPrefs, preferenceName)
    value = persistentPrefs.(preferenceName);
else
    value = defaultValue;
end
