*** Settings ***
Documentation    Cenários de testes de pré-cadastro de clientes

Library    Browser
Resource    ../resources/base.resource

*** Test Cases ***
Deve iniciar o cadastro do clientes

    ${account}    Get Fake Account
    New Browser    browser=chromium    headless=False
    New Page    http://localhost:3000/

    Get Text    
    ...    css=#signup h2
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name    ${account}[name]
    Fill Text    id=email    ${account}[email]
    Fill Text    id=document    ${account}[document]
    Click    css=button >> text=Cadastrar

    Wait For Elements State   
    ...    text=Falta pouco para fazer parte da família Smartbit!
    ...    visible    5  

Campo nome deve ser obrigatório
    [Tags]    required

    ${account}    Get Fake Account
    New Browser    browser=chromium    headless=False
    New Page    http://localhost:3000/

    Get Text    
    ...    css=#signup h2
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=email    ${account}[email]
    Fill Text    id=document    ${account}[document]
    Click    css=button >> text=Cadastrar

    Wait For Elements State   
    ...    css=.notice >> text=Por favor informe o seu nome completo
    ...    visible    5

Campo email deve ser obrigatório
    [Tags]    required

    ${account}    Get Fake Account
    New Browser    browser=chromium    headless=False
    New Page    http://localhost:3000/

    Get Text    
    ...    css=#signup h2
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!
    
    Fill Text    id=name    ${account}[name]
    Fill Text    id=document    ${account}[document]
    Click    css=button >> text=Cadastrar

    Wait For Elements State   
    ...    css=.notice >> text=Por favor, informe o seu melhor e-mail
    ...    visible    5

Campo cpf deve ser obrigatório
    [Tags]    required

    ${account}    Get Fake Account
    New Browser    browser=chromium    headless=False
    New Page    http://localhost:3000/

    Get Text    
    ...    css=#signup h2
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!
    
    Fill Text    id=name    ${account}[name]
    Fill Text    id=email    ${account}[email]
    Click    css=button >> text=Cadastrar

    Wait For Elements State   
    ...    css=.notice >> text=Por favor, informe o seu CPF
    ...    visible    5

E-mail no formato invalido
    [Tags]    inv

    ${account}    Get Fake Account
    New Browser    browser=chromium    headless=False
    New Page    http://localhost:3000/

    Get Text    
    ...    css=#signup h2
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name    ${account}[name]
    Fill Text    id=email    teste!teste.com
    Fill Text    id=document    ${account}[document]
    Click    css=button >> text=Cadastrar

    Wait For Elements State   
    ...    css=.notice >> text=Oops! O email informado é inválido
    ...    visible    5

CPF no formato incorreto
    [Tags]    inv

    ${account}    Get Fake Account
    New Browser    browser=chromium    headless=False
    New Page    http://localhost:3000/

    Get Text    
    ...    css=#signup h2
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name    ${account}[name]
    Fill Text    id=email    teste@teste.com
    Fill Text    id=document    99380061000
    Click    css=button >> text=Cadastrar

    Wait For Elements State   
    ...    css=.notice >> text=Oops! O CPF informado é inválido
    ...    visible    5