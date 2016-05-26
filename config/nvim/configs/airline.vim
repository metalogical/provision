let g:airline#extensions#tabline#enabled = 1 " show the tabline
let g:airline#extensions#tabline#fnamemod = ':t' " show only the filename
let g:airline#extensions#tabline#buffer_idx_mode = 1 " index the buffers from 1 - 9

" buffer jumping
nmap <silent> <Leader>b1 <Plug>AirlineSelectTab1
nmap <silent> <Leader>b2 <Plug>AirlineSelectTab2
nmap <silent> <Leader>b3 <Plug>AirlineSelectTab3
nmap <silent> <Leader>b4 <Plug>AirlineSelectTab4
nmap <silent> <Leader>b5 <Plug>AirlineSelectTab5
nmap <silent> <Leader>b6 <Plug>AirlineSelectTab6
nmap <silent> <Leader>b7 <Plug>AirlineSelectTab7
nmap <silent> <Leader>b8 <Plug>AirlineSelectTab8
nmap <silent> <Leader>b9 <Plug>AirlineSelectTab9
