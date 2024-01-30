# Read in the pdb file

  load B.pdb

# Set orthoscopic view

  set orthoscopic, on

# Set view (axial) (USE THE CMD "GET_VIEW" IN PYMOL FOR THESE DATA)

# set_view (\
#    1.000000000,    0.000000000,    0.000000000,\
#    0.000000000,    1.000000000,    0.000000000,\
#    0.000000000,    0.000000000,    1.000000000,\
#    0.000000000,    0.000000000,  -68.055381775,\
#    0.000000000,   -0.000007629, -133.312744141,\
# -648.851989746,  784.962768555,   20.000000000 )

# Set view (side-on)

# set_view (\
#    0.019296950,   -0.039029546,   -0.999050081,\
#    0.006844250,    0.999219298,   -0.038904000,\
#    0.999787986,   -0.006086936,    0.019548832,\
#    0.000000000,    0.000000000, -198.810104370,\
#    0.003281593,    0.001214981,  -32.034999847,\
#  152.536743164,  245.083465576,   20.000000000 )
#set_view (\
#    -0.003933457,    0.322204739,   -0.946661770,\
#     0.013900330,   -0.946560085,   -0.322227836,\
#    -0.999895573,   -0.014426383,   -0.000755499,\
#     0.000000000,    0.000000000, -198.810104370,\
#     0.003281593,    0.001214981,  -32.034999847,\
#   156.743408203,  240.876800537,   20.000000000 )
set_view (\
    -0.003933457,    0.322204739,   -0.946661770,\
     0.013900330,   -0.946560085,   -0.322227836,\
    -0.999895573,   -0.014426383,   -0.000755499,\
     0.000000000,    0.000000000, -198.810104370,\
     0.003281593,    0.001214981,  -32.034999847,\
   156.743408203,  240.876800537,   20.000000000 )




# Turn off depth cue (use 1 to turn on)

  set depth_cue, 0

# Set background colour to white

  bg_color white


# Add the hydrogens

  h_add

# Initialise "selections"
  select c_atoms, symbol C
  select h_atoms, symbol H
  select o_atoms, symbol O
  select n_atoms, symbol N
  select p_atoms, symbol P

# Show the atoms as spheres

  set sphere_mode, 5

  show spheres, c_atoms
  show spheres, h_atoms
  show spheres, o_atoms
  show spheres, n_atoms
  show spheres, p_atoms

# Colour atoms
  color grey60, c_atoms
  color grey30  h_atoms
  color grey40, o_atoms
  color grey30, n_atoms
  color grey10, p_atoms

# Show ribbon

  show cartoon
  set cartoon_color, grey50
  set cartoon_nucleic_acid_mode, 0
  set cartoon_ring_mode, 0
  set cartoon_ladder_mode, 0
  cartoon tube
  set cartoon_tube_radius,0.20

# To prepare the image we need to specify the quality. 

  set surface_quality, 4
  rebuild

# Turn on antialiasing

  set antialias, 4

# To set the scale of the spheres equal to the Van der Waal radius
# just use "set sphere_scale"
# Here we set it as a percentage of the vdwr

  set sphere_scale, 0.250, c_atoms
  set sphere_scale, 0.200, h_atoms
  set sphere_scale, 0.270, o_atoms
  set sphere_scale, 0.210, n_atoms
  set sphere_scale, 0.400, p_atoms

# Define the colour and thickness of the bond-sticks

  set_bond stick_color, black, (all), (all)
  set_bond stick_radius, 0.16, (all), (all)
   show sticks

# Set the transparency of the spheres, 0=solid, 0.3 semi-transparent.

  set sphere_transparency, 0.0

# Set background to transparent (off or 0=transparent, on or 1=opaque)
  set ray_opaque_background, 1

# To have a black and white figure the following settings are used: 
# set ray_trace_mode, 2
  set ray_trace_mode, 1
  set ambient, 1
  set reflect, 0
  set two_sided_lighting, on

# The command
# "ray" turns on ray tracing of the image.  For publication, 300 dpi
# is standard, and if the image is to be 4 inches in size then
# 300x4=1200 which is the value used here.

  ray 2400,2400

# save image to file

# png b-dna-linear.png, dpi=600, ray=1
  png b-dna-linear.png
