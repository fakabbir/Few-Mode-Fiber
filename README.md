# Imprantant notes
test.m is a template file that is used to copied to test_cover to produce the result. Please follow the same procedure to ake the task easy.
# Details of Files and implementation:
## File used to do numerical simulation are:
    1. ABcoeff.m
    2. bisec.m
    3. circle_edfa.m
    4. findP.m
    5. modesolver_l.m
## File having the design parameter:
    1. fvalues.m
    2. fvalues_template.m (Template to reuse fvalues.m)
## File that run the simulation with the desired parameter:
    1. test.m
    2. test_template.m (Template to resue test.m)
## Working:
  Set the values in fvalues.m is set accoring to the fiber design.
  
  Run test.m. If needed change the value of test.m and fvalues.m using the template.
  
###After running sucessfully, a new folder with the design name given is generated with the following files
     1. fvalues.m file
     2. python notebook for garph
     3. neff values
     4. DMD values
     5. test.m file
# Few-Mode-Fiber
Analysis of efficiency and capacity of few mode optical fibers.
# Introduction
A breif detail about fibers and the physics behind is discussed followed by how to use the code.
# Modal Delay
Inter modal delay or modal delay appears only in multi mode fibers. This is due to the different group velocity of each mode at a single frequency. the maximum pulse broadening arises due to the longest and the shortest path traveled by the modes.
Hence T=T_max-T_min.
Generally Fiber capacity is defined by bit-rate distance product (BL)
Where distance L, is the possible transmission distance.
For a given signal to remain distinguishable at the receiver end. The pulse spread should be less than 1/B, which is the width of a bit period.
This means simply that the Modal Delay should be less than 1/B.

# TODO: Add comments to ipy notebook and update master's notebook.
