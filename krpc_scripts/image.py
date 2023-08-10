import math
import time
import sys
import krpc

conn = krpc.connect(
    name='My Example Program',
    address='192.168.1.7',
    rpc_port=50000, stream_port=50001)

vessel = conn.space_center.active_vessel

#time_to_apoapsis = conn.add_stream(getattr, vessel.orbit, 'time_to_apoapsis')
#direction = conn.add_stream(vessel.direction, vessel.orbital_reference_frame)
#rotation = conn.add_stream(vessel.rotation, vessel.orbital_reference_frame)

#while True:
    #print(direction())
    #print(rotation())
#
#    sys.stdout.write(str(time_to_apoapsis()))
#    sys.stdout.flush()
#    time.sleep(0.01)


def cross_product(u, v):
    return (u[1]*v[2] - u[2]*v[1],
            u[2]*v[0] - u[0]*v[2],
            u[0]*v[1] - u[1]*v[0])


def dot_product(u, v):
    return u[0]*v[0] + u[1]*v[1] + u[2]*v[2]


def magnitude(v):
    return math.sqrt(dot_product(v, v))


def angle_between_vectors(u, v):
    """ Compute the angle between vector u and v """
    dp = dot_product(u, v)
    if dp == 0:
        return 0
    um = magnitude(u)
    vm = magnitude(v)
    return math.acos(dp / (um*vm)) * (180. / math.pi)


while True:
    vessel_direction = vessel.direction(vessel.surface_reference_frame)

    #sys.stdout.write(str(vessel_direction))

    # Get the direction of the vessel in the horizon plane
    horizon_direction = (0, vessel_direction[1], vessel_direction[2])

    # Compute the pitch - the angle between the vessels direction and
    # the direction in the horizon plane
    pitch = angle_between_vectors(vessel_direction, horizon_direction)
    if vessel_direction[0] < 0:
        pitch = -pitch

    # Compute the heading - the angle between north and
    # the direction in the horizon plane
    north = (0, 1, 0)
    heading = angle_between_vectors(north, horizon_direction)
    if horizon_direction[2] < 0:
        heading = 360 - heading

    # Compute the roll
    # Compute the plane running through the vessels direction
    # and the upwards direction
    up = (1, 0, 0)
    plane_normal = cross_product(vessel_direction, up)
    # Compute the upwards direction of the vessel
    vessel_up = conn.space_center.transform_direction(
        (0, 0, -1), vessel.reference_frame, vessel.surface_reference_frame)
    # Compute the angle between the upwards direction of
    # the vessel and the plane normal
    roll = angle_between_vectors(vessel_up, plane_normal)
    # Adjust so that the angle is between -180 and 180 and
    # rolling right is +ve and left is -ve
    if vessel_up[0] > 0:
        roll *= -1
    elif roll < 0:
        roll += 180
    else:
        roll -= 180



    sys.stdout.write('%5.1f,%5.1f,%5.1f' % (pitch, heading, roll))
    #sys.stdout.write('% 5.1f' % (pitch))
    sys.stdout.flush()
    time.sleep(0.1)

    #time.sleep(1)
