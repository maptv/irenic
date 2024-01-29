# Read in the pdb file

  load dna.pdb

# Set orthoscopic view

  set orthoscopic, on

# Set view (axial) (USE THE CMD "GET_VIEW" IN PYMOL FOR THESE DATA)

  set_view (\
     1.000000000,    0.000000000,    0.000000000,\
     0.000000000,    1.000000000,    0.000000000,\
     0.000000000,    0.000000000,    1.000000000,\
     0.000000000,    0.000000000,  -68.055381775,\
     0.000000000,   -0.000007629, -133.312744141,\
  -648.851989746,  784.962768555,   20.000000000 )

# Set view (side-on)

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
  color grey80, c_atoms
  color white,  h_atoms
  color grey60, o_atoms
  color grey30, n_atoms
  color grey10, p_atoms

# To prepare the image we need to specify the quality. 

  set surface_quality, 3
  rebuild

# Turn on antialiasing

  set antialias, 4

# To set the scale of the spheres equal to the Van der Waal radius
# just use "set sphere_scale"
# Here we set it as a percentage of the vdwr

  set sphere_scale, 0.200, c_atoms
  set sphere_scale, 0.100, h_atoms
  set sphere_scale, 0.250, o_atoms
  set sphere_scale, 0.150, n_atoms
  set sphere_scale, 0.300, p_atoms

# Define the colour and thickness of the bond-sticks

  set_bond stick_color, black, (all), (all)
  set_bond stick_radius, 0.10, (all), (all)
#  show sticks

# Set the transparency of the spheres, 0=solid, 0.3 semi-transparent.

  set sphere_transparency, 0.0

# Set background to transparent (off or 0=transparent, on or 1=opaque)
  set ray_opaque_background, 0

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

  ray 1200,1200

# save image to file

  png b-dna-axial.png, dpi=300, ray=1
