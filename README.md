## WeWork Technical Assessment for iOS Engineer

### Credit card validation: Write a method that given a valid credit card number returns true

Validating a credit card number follows these steps:
1. Starting with the next to last digit and continuing with every other digit going back to the beginning of the card, double the digit
2. Sum all doubled and untouched digits in the number
3. If that total is a multiple of 10, the number is valid
