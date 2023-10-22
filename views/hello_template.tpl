%include header.tpl title="test", subtitle="test2"

%if name == 'World':
    <h1>Hello {{name}}!</h1>
    <p>This is a test.</p>
%else:
    <h1>Hello {{name}}!</h1>
    <p>How are you?</p>
%end

%for expense in expenses:
    <p>You spent {{expense}} {{expense['category']}}</p>
%end