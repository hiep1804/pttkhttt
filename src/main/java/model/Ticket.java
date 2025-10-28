/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Ticket {
    private int id;
    private float price;

    // Relationships
    private ScreeningSchedule screeningSchedule;
    private Seat seat;

    public Ticket() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public ScreeningSchedule getScreeningSchedule() {
        return screeningSchedule;
    }

    public void setScreeningSchedule(ScreeningSchedule screeningSchedule) {
        this.screeningSchedule = screeningSchedule;
    }

    public Seat getSeat() {
        return seat;
    }

    public void setSeat(Seat seat) {
        this.seat = seat;
    }
    
}

