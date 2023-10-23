% rebase('base.tpl',title='test')
%include header.tpl title="test", subtitle="test2"

<form action="/expenses" method="post">
    Description: <input name="description" type="text" />
    Amount: <input name="amount" type="number" min=0 step=0.01 />
    Date: <input name="date" type="date" />
    <input value="Create" type="submit" />
    <select name="category">
        <option value="food">Food</option>
        <option value="transport">Transport</option>
        <option value="housing">Housing</option>
        <option value="utilities">Utilities</option>
        <option value="clothing">Clothing</option>
        <option value="health">Health</option>
        <option value="insurance">Insurance</option>
        <option value="household">Household</option>
        <option value="personal">Personal</option>
        <option value="education">Education</option>
        <option value="entertainment">Entertainment</option>
        <option value="gifts">Gifts</option>
        <option value="other">Other</option>
    </select>
</form>

<table class="table-auto">
  <thead>
    <tr>
     <th>Date</th>
      <th>Description</th>
      <th>Amount</th>
      <th>Category</th>
      <th>Actions</th>
    </tr>
  </thead>
  <tbody>
  %for expense in expenses:
    <tr>
    <td>{{expense['date']}}</td>
      <td>{{expense['description']}}</td>
      <td>{{expense['amount']}}</td>
      <td>{{expense['category']}}</td>
      <td>
        <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
          Edit
        </button>
        <form action="/expenses" method="post"> 
        <input type="hidden" name="id" value="{{expense['id']}}" />
        <input type="hidden" name="_method" value="delete" />
        <button class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">
          Delete
        </button>
        </form>
     
        </td>
    </tr>
   %end
  </tbody>
</table>

%if name == 'World':
    <h1 class="text-3xl font-bold underline">Hello {{name}}!</h1>
    <p>This is a test.</p>
%else:
    <h1 class="text-3xl font-bold underline">Hello {{name}}!</h1>
    <p>How are you?</p>
%end

%for expense in expenses:
    <p>You spent {{expense}} {{expense['category']}}</p>
%end
