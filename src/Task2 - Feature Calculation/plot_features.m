function plot_features(avg, ranges)
    %% split the averages and ranges into the 3 balls
    avg_tennis = avg(:, 1:3);
    avg_football = avg(:, 4:6);
    avg_american = avg(:, 7:9);

    range_tennis = ranges(:, 1:3);
    range_football = ranges(:, 4:6);
    range_american = ranges(:, 7:9);

    %% split into the 3 texture features
    avg_tennis_asm = avg_tennis(:, 1);
    avg_tennis_cont = avg_tennis(:, 2);
    avg_tennis_corr = avg_tennis(:, 3);

    avg_football_asm = avg_football(:, 1);
    avg_football_cont = avg_football(:, 2);
    avg_football_corr = avg_football(:, 3);

    avg_american_asm = avg_american(:, 1);
    avg_american_cont = avg_american(:, 2);
    avg_american_corr = avg_american(:, 3);

    range_tennis_asm = range_tennis(:, 1);
    range_tennis_cont = range_tennis(:, 2);
    range_tennis_corr = range_tennis(:, 3);

    range_football_asm = range_football(:, 1);
    range_football_cont = range_football(:, 2);
    range_football_corr = range_football(:, 3);

    range_american_asm = range_american(:, 1);
    range_american_cont = range_american(:, 2);
    range_american_corr = range_american(:, 3);

    %% split into the 3 colour channels
    avg_tennis_asm_r = avg_tennis_asm(1:3:end);
    avg_tennis_cont_g = avg_tennis_cont(2:3:end);
    avg_tennis_corr_b = avg_tennis_corr(3:3:end);

    avg_football_asm_r = avg_football_asm(1:3:end);
    avg_football_cont_g = avg_football_cont(2:3:end);
    avg_football_corr_b = avg_football_corr(3:3:end);

    avg_american_asm_r = avg_american_asm(1:3:end);
    avg_american_cont_g = avg_american_cont(2:3:end);
    avg_american_corr_b = avg_american_corr(3:3:end);

    range_tennis_asm_r = range_tennis_asm(1:3:end);
    range_tennis_cont_g = range_tennis_cont(2:3:end);
    range_tennis_corr_b = range_tennis_corr(3:3:end);

    range_football_asm_r = range_football_asm(1:3:end);
    range_football_cont_g = range_football_cont(2:3:end);
    range_football_corr_b = range_football_corr(3:3:end);

    range_american_asm_r = range_american_asm(1:3:end);
    range_american_cont_g = range_american_cont(2:3:end);
    range_american_corr_b = range_american_corr(3:3:end);

    box_and_hist({avg_tennis_asm_r, avg_football_asm_r, avg_american_asm_r}, {avg_tennis_cont_g, avg_football_cont_g, avg_american_cont_g}, {avg_tennis_corr_b, avg_football_corr_b, avg_american_corr_b}, 'averages');
    box_and_hist({range_tennis_asm_r, range_football_asm_r, range_american_asm_r}, {range_tennis_cont_g, range_football_cont_g, range_american_cont_g}, {range_tennis_corr_b, range_football_corr_b, range_american_corr_b}, 'ranges');

end