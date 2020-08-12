--Exemplo 1 (sem SQL Dinâmico):

create or replace function pesquisa_pessoa(pcodigo number, pfiltro varchar2) return varchar2 is
v_nome_pessoa pessoas.nome%type;

begin
if(pfiltro = ‘RG’) then
select nome
into v_nome_pessoa
from pessoas
where rg = pcodigo;
elsif(pfiltro = ‘CPF’) then
select nome
into v_nome_pessoa
from pessoas
where cpf = pcodigo;
elsif(pfiltro = ‘CNH’) then
select nome
into v_nome_pessoa
from pessoas
where cnh = pcodigo;
end if;

return v_nome_pessoa;
end;
-------------------------------------------------------------------------------------------------------------------------------------------
create or replace function pesquisa_pessoa(pcodigo number, pfiltro varchar2) return varchar2 is
v_nome_pessoa pessoas.nome%type;
v_where varchar2(50);

begin
if(pfiltro = ‘RG’) then
v_where := ‘rg’;
elsif(pfiltro = ‘CPF’) then
v_where := ‘cpf’;
elsif(pfiltro = ‘CNH’) then
v_where := ‘cnh’;
end if;

dbms_output.put_line(‘select nome into v_nome_pessoa from pessoas where ‘||v_where||’ = ‘||pcodigo||’;’);