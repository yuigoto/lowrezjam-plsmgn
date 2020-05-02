/// @description Shift a value towards another by step
/// @function approach
/// @param start
/// @param end 
/// @param step

if (argument[0] > argument[1]) {
	return max(argument[0] - argument[2], argument[1]);
} else {
	return min(argument[0] + argument[2], argument[1]);
}
