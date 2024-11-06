section .data
    graph db 0, 1, 1, 1
    n db 2                

section .text
extern io_get_dec, io_print_dec, io_newline
global main

main:
    mov ebp, esp         
    mov ecx, 0           

    call find_hamiltonian
    test eax, eax        
    jz no_cycle          

    call io_print_dec    
    call io_newline
    jmp end

no_cycle:
    mov eax, 0
    call io_print_dec    
    call io_newline

end:
    xor eax, eax         
    ret                  

find_hamiltonian:
    mov eax, [graph]
    cmp eax, 1           
    jne no_cycle_found
    cmp byte [graph+1], 1 
    jne no_cycle_found

    mov eax, 1           
    ret

no_cycle_found:
    xor eax, eax         
    ret
