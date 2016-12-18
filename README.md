# Docsbr

A cli to create valid Br documents for development purpose :

* Cpf
* Cnpj

## Dependencies
The unique dependency to run the CLI is Erlang VM installed on your machine.
In order to contribute with development, you will need install Elixir.
To install Elixir and Erlang, see http://elixir-lang.org/install.html

## Usage

```$ ./docsbr --doc <cpf | cnpj> ```

### Examples

```
$ ./docsbr --doc cpf
45438706204

$ ./docsbr --doc cnpj
85260336075235
```
