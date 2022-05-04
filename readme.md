# ROM (READ-ONLY MEMORY)
## Shahbaz Hasssan Khan Malik

This is a ROM module with active-high OE (output enable) signal, active low CS (chip select).
The contents of the currently specified address are placed on the data bus when oe is 
high. As long as oe remains high, the contents of the newly specified address are 
placed on the data bus. The data bus returns to the high impedance state after oe goes low.    

<img width="669" alt="Screen Shot 2022-05-04 at 1 32 55 PM" src="https://user-images.githubusercontent.com/98668171/166821070-998b819c-0193-46e3-9dc9-64be00b9e48f.png">
