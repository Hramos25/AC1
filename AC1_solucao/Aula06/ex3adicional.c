int main(int argc,char *argv[])
{
    char **p;
    char **pultimo;

    print_string("Nr. de parametros: ");
    print_int10(argc);

    pultimo = argv + argc;

    p = argv

    for(;p < pultimo;p++)
    {
        print_string("\nP");
        print_int10(p - argv);
        print_string(": ");
        print_string(*p);
        
    }
}