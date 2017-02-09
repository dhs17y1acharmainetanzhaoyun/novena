use <MCAD/shapes/2Dshapes.scad>
include <MCAD/units/metric.scad>

$fs = 0.4;
$fa = 1;

module corner_radius (r)
{
    difference () {
        translate ([1, 1] * -epsilon)
        square ([r, r]);

        translate ([r, r])
        circle (r = r);
    }
}

difference () {
    union () {
        ccube ([52.24, 18.11, 2.21], center = X);

        translate ([50.17 / 2, 0, 3.05 - epsilon])
        mirror (Z)
        cube ([2.04, 18.11, 1.26]);

        translate ([-50.17 / 2, 0, 3.16 - epsilon])
        mirror (X)
        mirror (Z)
        cube ([2.12, 18.11, 1.36]);

        translate ([50.17 / 2, 7.17, 4.28])
        mirror (Z)
        cube ([5.1, 12.82, 1.23]);

        translate ([-50.17 / 2, 6.6, 4.33])
        union () {
            mirror (Z)
            linear_extrude (height = 1.34)
            union () {
                mirror (X)
                square ([4.83, 13.01]);

                difference () {
                    mirror (X)
                    square ([15.8, 9.25]);

                    translate ([-15.85, 0])
                    corner_radius (3.53);
                }
            }

            translate ([-15.85, 9.25, -1.34])
            rotate (90, X)
            linear_extrude (height = 2.09) {
                difference () {
                    union () {
                        square ([8.39, 4.83]);

                        translate ([8.39 / 2, 4.83])
                        circle (d = 8.39);
                    }

                    translate ([8.39 / 2, 4.83])
                    circle (d = 2.25);
                }
            }
        }
    }

    rotate (-90, Y)
    linear_extrude (height = 1000, center = true)
    corner_radius (3.14);

    /* connector holes */
    for (x = [1/4, -1/4] * 50.17)
        translate ([x, 18.22 / 2])
        cylinder (d = 6.2, h = 100, center = true);
}
