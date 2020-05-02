/// @description Explodes a string, by splitting it on every occurrence of sub
/// @function stringExplode 
/// @param {string} sub Substring or pattern that marks a split
/// @param {string} source The string to be split

// Humanize input
var sub     = argument[0];
var source  = argument[1];

// Initial position to slice the string
var s_init  = 0;

// Number of characters to slice from the string
var s_size  = noone;

// Next initial value, use only when we push a new value to the array
var s_next  = noone;

// Current copy of the substring, to check for matches
var subcopy = "";

// Current position on the substring, to check for matches
var curr    = 1;

// List to return
var list = [];

// We're looping the whole string
for (var i = 1; i < string_length(source) + 1; i++) {
    // If we reached the end of the string, s_last == string_length - 1
    if (i == string_length(source)) {
        // Set final s_size
        s_size = i - s_init;
    } else {
        // Check for substring occurrences
        if (string_char_at(source, i) == string_char_at(sub, curr)) {
            // Add character to our substring copy
            subcopy += string_char_at(source, i);
            
            // Increase curr count
            curr += 1;
            
            // If we reached the end of the string, reset curr
            if (curr == string_length(sub) + 1) curr = 1;
        } else {
            // Reset both curr and copy, so we can keep going on
            subcopy = "";
            curr = 1;
        }
        
        // If we did find a match for the substring
        if (subcopy == sub) {
            // First, define the initial value for s_last
            s_size = i - string_length(sub);
            
            // If the current s_init > 0, subtract s_init - 1 from s_last
            if (s_init > 0) s_size -= s_init - 1;
            
            // Then, we define s_next
            s_next = i + 1;
        }
    }
    
    // If our size != noone, we can copy a string
    if (s_size != noone) {
        // Copy 
        var copy = string_copy(source, s_init, s_size);
        
        // Push into the array
        if (array_length_1d(list) == 0) {
            list[0] = copy;
        } else {
            // If bigger than 0, array_length_1d can be used as index value
            list[array_length_1d(list)] = copy;
        }
        
        // Set new s_init and reset s_size
        s_init = s_next;
        s_size = noone;
    }
}

// Return the exploded string
return list;
