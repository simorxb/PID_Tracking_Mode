scheme = "C:\Users\berto\OneDrive\Documents\Linkedin\LinkedinContentCode\linkedincontentcode\Tracking mode\Car + PID + tracking.zcos";

// Simulate first
importXcosDiagram(scheme);
typeof(scs_m); //The diagram data structure
ctx = ["m = 1000; b = 1; kp = 30; ki = 2;kaw = 8; kd = 100; T = 0.1; T_c = 5; stp = 30; std_noise = 1;"];

scs_m.props.context = ctx;
xcos_simulate(scs_m, 4);

// Draw
subplot(312);
h = plot(u_out.time, u_out.values, 'b-', track_out.time, track_out.values, 'r-', 'LineWidth',3);
l = legend("PID command", "Tracking setpoint");
l.font_size = 3;
ax=gca(),// gat the handle on the current axes
ax.data_bounds=[0 -500;250 2000];
set(gca(),"grid",[1 1]);
xlabel('t[s]', 'font_style', 'times bold', 'font_size', 3);
ylabel('F [N]', 'font_style', 'times bold', 'font_size', 3);

subplot(311);
h = plot(y_out.time, y_out.values, 'b-', stp_out.time, stp_out.values, 'r-', 'LineWidth',3);
l = legend("Response", "Setpoint");
l.font_size = 3;
ax=gca(),// get the handle on the current axes
ax.data_bounds=[0 0;250 50];
set(gca(),"grid",[1 1]);
xlabel('t[s]', 'font_style', 'times bold', 'font_size', 3);
ylabel('Speed [m/s]', 'font_style', 'times bold', 'font_size', 3);

subplot(313);
h = plot(auto_track_out.time, auto_track_out.values, 'b-', 'LineWidth',3);
l = legend("Auto / tracking mode");
l.font_size = 3;
ax=gca(),// get the handle on the current axes
ax.data_bounds=[0 0;250 1];
set(gca(),"grid",[1 1]);
xlabel('t[s]', 'font_style', 'times bold', 'font_size', 3);
