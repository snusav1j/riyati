var dropdownButtons = document.querySelectorAll('.nav-dropdown .dropdown-btn');
var dropdownLists = document.querySelectorAll('.dropdown-list');

for (button of dropdownButtons) {
  button.addEventListener('click', dropdownEvent);
}

function dropdownEvent(event) {
  var menuName = event.target.dataset.menu;
  var dropdownList = document.getElementById(menuName);
  var dropdownButton = event.target;

  event.stopPropagation();

  if (dropdownList.classList.contains('active')) {
    dropdownList.classList.remove('active');
    dropdownButton.classList.remove('active');
  } else {
    for (button of dropdownButtons) {
      button.classList.remove('active');
    }

    for (list of dropdownLists) {
      list.classList.remove('active');
    }

    dropdownList.classList.add('active');
    dropdownButton.classList.add('active');

    document.addEventListener('keyup', function(event) {
      keyboardFocus(event, dropdownList, dropdownButton);
    });

    document.body.addEventListener('click', function(event) {
      closeMenuClickedOutside(dropdownButton, dropdownList)
    });
  }
};

function keyboardFocus(event, dropdownList, dropdownButton) {
  var focusedParent = dropdownList.querySelector('.focused');
  var listItems = dropdownList.children;
  var up = event.keyCode === 38;
  var down = event.keyCode === 40;

  if ((dropdownButton === event.target) && down) {
    dropdownList.firstElementChild.firstElementChild.focus();
  } else if (up) {
    var prevItem = focusedParent.previousElementSibling;
    var lastListItem = listItems[listItems.length-1];

    focusedParent.classList.remove('focused');

    if (prevItem != null) {
      prevItem.classList.add('focused');
      prevItem.children[0].focus();
    } else {
      lastListItem.classList.add('focused');
      lastListItem.children[0].focus();
    }
  } else if (down) {
    var nextItem = focusedParent.nextElementSibling;
    var firstListItem = listItems[0];

    focusedParent.classList.remove('focused');

    if (nextItem != null) {
      nextItem.classList.add('focused');
      nextItem.children[0].focus();
    } else {
      firstListItem.classList.add('focused');
      firstListItem.children[0].focus();
    }
  }
};

function closeMenuClickedOutside(dropdownButton, dropdownList) {
  dropdownButton.classList.remove('active');
  dropdownList.classList.remove('active');
}
