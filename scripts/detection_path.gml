var count;
count = 0;
access = false;
start_x = obj_maze_create.origin_x;
start_y = obj_maze_create.origin_y;

book[start_x,start_y] = 1;
dfs(start_x, start_y);
