describe('template spec', () => {
  it('passes', () => {
    cy.visit('http://10.201.4.206/ATM-MANAGEMENT-SYSTEM-master/')
  })
  it('Verify Title Of The Profile Page', () => {
    cy.visit('http://10.201.4.206/ATM-MANAGEMENT-SYSTEM-master/')
     cy.title().should('eq','ATM Management System')
  })
  it('Verify heading Of The Profile Page', () => {
    cy.visit('http://10.201.4.206/ATM-MANAGEMENT-SYSTEM-master/')
    cy.get('.header').contains('Welcome to KarnatakaBank ATM')
  })
  it('Verify Admin user', () => {
    
    cy.on('uncaught:exception', (err, runnable) => {
    //expect(err.message).to.include('something about the error')
    //done()
    return false
    })

    cy.visit('http://10.201.4.206/ATM-MANAGEMENT-SYSTEM-master/admin.php')
    cy.get('#admin_pin').type('1122')
    cy.get('#atm_id').type('120')
    cy.get('#admin_id').type('500')
    //cy.get('div[align="center"] > #reg-head').should('eq','Registration Success')
    cy.contains('Submit').click()
  })
})
describe('atm testing 2',()=>{
  it('Verify Pin', () => {
    
    cy.on('uncaught:exception', (err, runnable) => {
    //expect(err.message).to.include('something about the error')
    //done()
    return false
    })

    cy.visit('http://10.201.4.206/ATM-MANAGEMENT-SYSTEM-master/pin.php')
    cy.get('#pin').type('1111')
    
    //cy.get('div[align="center"] > #reg-head').should('eq','Registration Success')
    cy.contains('Submit').click()
  })
  it('Verify pin and  Balance Enquiry', () => {
    
    cy.on('uncaught:exception', (err, runnable) => {
    //expect(err.message).to.include('something about the error')
    //done()
    return false
    })
    cy.visit('http://10.201.4.206/ATM-MANAGEMENT-SYSTEM-master/pin.php')
    cy.get('#pin').type('1111')
    cy.contains('Submit').click()
    //cy.get('div[align="center"] > #reg-head').should('eq','Registration Success')
    cy.get('#balance_enquiry').click()
  })
  it('Verify Pin Change', () => {
    
    cy.on('uncaught:exception', (err, runnable) => {
    //expect(err.message).to.include('something about the error')
    //done()
    return false
    })
    cy.visit('http://10.201.4.206/ATM-MANAGEMENT-SYSTEM-master/pin.php')
    cy.get('#pin').type('1111')
    cy.contains('Submit').click()
    //cy.get('div[align="center"] > #reg-head').should('eq','Registration Success')
    cy.get('#pinchange').click()
    cy.get('#enter_pin').type('1111')
    cy.contains('Submit').click()
  })
  it('Verify Pin Change message and exit', () => {
    
    cy.on('uncaught:exception', (err, runnable) => {
    //expect(err.message).to.include('something about the error')
    //done()
    return false
    })
    cy.visit('http://10.201.4.206/ATM-MANAGEMENT-SYSTEM-master/pin.php')
    cy.get('#pin').type('1111')
    cy.contains('Submit').click()
    //cy.get('div[align="center"] > #reg-head').should('eq','Registration Success')
    cy.get('#pinchange').click()
    cy.get('#enter_pin').type('1111')
    cy.contains('Submit').click()
    cy.get('.header').contains("Pin is Successfully Changed")
    cy.get('.button').click()
  })
  it('Verify Fund Transfer', () => {
    
    cy.on('uncaught:exception', (err, runnable) => {
    //expect(err.message).to.include('something about the error')
    //done()
    return false
    })
    cy.visit('http://10.201.4.206/ATM-MANAGEMENT-SYSTEM-master/pin.php')
    cy.get('#pin').type('8198')
    cy.contains('Submit').click()
    cy.get('#fund_transfer').click()
    cy.visit('http://10.201.4.206/ATM-MANAGEMENT-SYSTEM-master/fundtransfer.php')
    cy.get('#acc_no').type('1006')
    cy.get('#amount').type('1000')
    cy.contains('Submit').click()
    //cy.get('div[align="center"] > #reg-head').should('eq','Registration Success')
  })
  it('Verify Cash Withdrawal', () => {
    
    cy.on('uncaught:exception', (err, runnable) => {
    //expect(err.message).to.include('something about the error')
    //done()
    return false
    })
    cy.visit('http://10.201.4.206/ATM-MANAGEMENT-SYSTEM-master/pin.php')
    cy.get('#pin').type('8198')
    cy.contains('Submit').click()
    cy.get('#cash_withdrawal').click()
    cy.visit('http://10.201.4.206/ATM-MANAGEMENT-SYSTEM-master/cash.php')
    cy.get('#savings').click()
    cy.visit('http://10.201.4.206/ATM-MANAGEMENT-SYSTEM-master/savings.php')
    cy.get('#amount').type('1000')
    cy.contains('Submit').click()
    //cy.get('div[align="center"] > #reg-head').should('eq','Registration Success')
  })
})