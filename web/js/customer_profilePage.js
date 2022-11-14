<<<<<<< Updated upstream
var form = document.querySelectorAll('.form')
var navi_link = document.querySelectorAll('.navi--link')

const account = document.querySelector('.account')
const order_his = document.querySelector('.order-his')
const address = document.querySelector('.address')
const password = document.querySelector('.password')

const account_form = document.querySelector('.account-form')
const order_his_form = document.querySelector('.order-his-form')
const address_form = document.querySelector('.address-form')
const password_form = document.querySelector('.password-form')

const address_add = document.querySelector('.address_add')
const address_detail__add = document.querySelector('.address_detail__add')
const close_address = document.querySelector('.close_address')


const address_edit = document.querySelectorAll('.address_edit')
const address_detail__edit = document.querySelectorAll('.address_detail__edit')
const close_edit_address = document.querySelectorAll('.close_edit_address')

console.log(account)

// account.addEventListener('click', function() {
//     CloseAllForm()
//     ResetLink()
//     account.classList.add('bold')
//     account_form.classList.remove('hide')
// })
=======
var form = document.querySelectorAll('.form');
var navi_link = document.querySelectorAll('.navi--link');

const account = document.querySelector('.account');
const order_product_his = document.querySelector('.order-product-his');
const order_service_his = document.querySelector('.order-service-his');
const order_pending = document.querySelector('.order-pending');
const order_canceled = document.querySelector('.order-canceled');
const address = document.querySelector('.address');
const password = document.querySelector('.password');

const account_form = document.querySelector('.account-form');
const order_product_his_form = document.querySelector('.order-product-his-form');
const order_service_his_form = document.querySelector('.order-service-his-form');
const order_pending_form = document.querySelector('.order-pending-form');
const order_canceled_form = document.querySelector('.order-canceled-form');
const address_form = document.querySelector('.address-form');
const password_form = document.querySelector('.password-form');

const address_add = document.querySelector('.address_add');
const address_detail__add = document.querySelector('.address_detail__add');
const close_address = document.querySelector('.close_address');

const review_add = document.querySelectorAll('.review_add');
const review_detail__add = document.querySelectorAll('.review_detail__add');
const close_review = document.querySelectorAll('.close_review');

console.log(review_add);
console.log(review_detail__add);
>>>>>>> Stashed changes

address_add.addEventListener('click', function() {
    address_detail__add.classList.remove('hide');
});

close_address.addEventListener('click', function() {
    address_detail__add.classList.add('hide');
});

for(let i = 0; i < review_add.length; i++) {
    review_add[i].addEventListener('click', function() {
        review_detail__add[i].classList.remove('hide');
    });
};

for(let i = 0; i < close_review.length; i++) {
    close_review[i].addEventListener('click', function() {
        review_detail__add[i].classList.add('hide');
    });
}

account.addEventListener('click', function() {
    CloseAllForm();
    ResetLink();
    account.classList.add('bold');
    account_form.classList.remove('hide');
});

<<<<<<< Updated upstream
order_his.addEventListener('click', function() {
    CloseAllForm()
    ResetLink()
    this.classList.add('bold')
    order_his_form.classList.remove('hide')
})
=======
order_product_his.addEventListener('click', function() {
    CloseAllForm();
    ResetLink();
    this.classList.add('bold');
    order_product_his_form.classList.remove('hide');
});

order_service_his.addEventListener('click', function() {
    CloseAllForm();
    ResetLink();
    this.classList.add('bold');
    order_service_his_form.classList.remove('hide');
});

order_pending.addEventListener('click', function() {
    CloseAllForm();
    ResetLink();
    this.classList.add('bold');
    order_pending_form.classList.remove('hide');
});

order_canceled.addEventListener('click', function() {
    CloseAllForm();
    ResetLink();
    this.classList.add('bold');
    order_canceled_form.classList.remove('hide');
});
>>>>>>> Stashed changes

address.addEventListener('click', function() {
    CloseAllForm();
    ResetLink();
    this.classList.add('bold');
    address_form.classList.remove('hide');
});

password.addEventListener('click', function() {
    CloseAllForm();
    ResetLink();
    this.classList.add('bold');
    password_form.classList.remove('hide');
});

function CloseAllForm() {
    for(var i = 0; i < form.length; i++) {
        form[i].classList.add('hide');
    }
}

function ResetLink() {
<<<<<<< Updated upstream
    for(var i = 0; i < form.length; i++) {
        navi_link[i].classList.remove('bold')
=======
    for(var i = 0; i < navi_link.length; i++) {
        navi_link[i].classList.remove('bold');
>>>>>>> Stashed changes
    }
}