


// 30mm units per axis
function e_units(length) = (length - 120)/30;

function e_length(units, count) =
    units*30/count;

function t_length(e_length_d) = max(120, e_length_d);

function t_offset(e_length_t) = (190 - e_length_t)/2;


module print_parts(
    width, depth, height, e_count_w,
    e_count_d, e_count_h
) {

    e_units_w = e_units(width);
    e_units_d = e_units(depth);
    e_units_h = e_units(height);

    e_length_w = e_length(e_units_w, e_count_w);
    e_length_d = e_length(e_units_d, e_count_d);
    e_length_h = e_length(e_units_h, e_count_h);

    e_length_t = t_length(e_length_d);
    offset_t = t_offset(e_length_t);

    e_units_dt = e_units(depth - e_length_t);
    e_count_dt = max(1, e_count_d - 1);
    e_length_dt = e_length(e_units_dt, e_count_dt);

    // single printable beam lengths
    echo("Extention lengths (total, pieces)");
    echo("w: ", e_units_w*30, e_length_w);
    echo("h: ", e_units_h*30, e_length_h);
    echo("d: ", e_units_d*30, e_length_d);
    echo("t: ", e_length_t, 1);

    echo("T extention side details (total, pieces)");
    echo("d: ", e_length_dt, e_count_dt);
}

